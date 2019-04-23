class FindClustersJob < ApplicationJob

  def perform(*args)
    # load stopwords for removal when analyzing
    stop_words = Hash.new(false)
    occurrence_map = {}
    File.readlines('app/assets/stopwords.txt').each do |line|
      stop_words[line] = true
    end

    # load all unarchived reports, NOT SAVING
    reports = Report.where(resolved: false).sort_by
    # clear existing categories (testing)
    ReportGroup.delete_all
    # categories = [
    #   lambda(&:description),
    #   lambda(&:location),
    #   lambda(&:involved)
    # ]


    # I'm so sorry
    # Get all the words
    # I tried making this with lambdas but ruby wouldn't cooperate
    reports.each do |my_report|
      my_report.description.split(/\s/).each do |word|
        next if stop_words[word.downcase]

        list = occurrence_map[word.downcase]
        list = [] if list.nil?
        list.push my_report unless list.include?(my_report)
        occurrence_map[word.downcase] = list
      end

      my_report.location.split(/\s/).each do |word|
        next if stop_words[word.downcase]

        list = occurrence_map[word.downcase]
        list = [] if list.nil?
        list.push my_report unless list.include?(my_report)
        occurrence_map[word.downcase] = list
      end

      my_report.involved.split(/\s/).each do |word|
        next if stop_words[word.downcase]

        list = occurrence_map[word.downcase]
        list = [] if list.nil?
        list.push my_report unless list.include?(my_report)
        occurrence_map[word.downcase] = list
      end
    end

    # We have the words
    # Ugh
    #
    # Okay now for clustering
    # I hope this works
    #
    # Get largest indexes
    sorted_counts = []
    occurrence_map.each do |_, v|
      sorted_counts.push v.length unless sorted_counts.include? v.length
    end
    # sort descending
    sorted_counts = sorted_counts.sort.reverse
    sorted_counts = sorted_counts[0, 15]

    # okay, now find the values that match
    limit = 20
    count = 0
    occurrence_map.each do |k, v|
      next unless sorted_counts.include? v.length
      next unless count < limit

      group = ReportGroup.new(name: k.to_s)
      v.each { |report| group.reports << report }
      count += 1
      group.save
    end
  end
end

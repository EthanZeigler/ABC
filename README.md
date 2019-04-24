# Anti-Bully Connection
### A ruby on rails program for manging bullying incidents in your organization

## Issue

Bullying is a massive national problem. The idea of "snitches get stitches" is problematic for educators and administration. The idea that others will figure out who said something discorages them from getting help, and new laws such as HIB cannot be effective if people aren't willing to speak out about problems.

## Solution

Creating a customizable webapp for reporting bullying incidents anonomyously (or named if one wants to) that allows educators to have a better idea of bullying incidents going on at their institution, even if a student does not want them to act on a specific incident.


This allows administrators to be more aware of bullying and bias incidents in a technological age. We are not aware of an open implementation of such a system.

## Implementation

#### Tools

- Rails
- Postgres
- Frustration
- Bootstrap

#### Functionality
- Event clustering, detecting reports that appear to be of the same type and highlighting them as a more serious situation
- Login system with proper security measures

#### Data Structures
- Database (Postgres) for storage of reports
- Correlations done by field similarity

#### Software Engineering Concepts (Course this is from)
- MVC model
- DBMS
- Security between student and admin sides


### Additional implementation details

The goal is to be able to have the system be a sort of 'ticket manager' for these reports. Notes will be added in a ongoing basis as things are handled. Reports can be sent to the reporter if they decided to not be anonymous. 

### Future
- Spam detection, detecting when a single user is submitting a lot of reports that are the same or vastly different, but not in between.

## Installation
1. Clone this repo
2. Initialize a postgresql server accessable by the project
3. Configure src/config/database.yml with your postgres credentials. Additional details can be found at https://rubyinrails.com/2014/01/09/database-yml-rails/.
4. Set the rails environment variable to production.
5. Initialize the backend database. `rails db:create&& rails db:migrate`
6. Start rails! `rails server --binding=<server-ip>`
7. Create a login from the top right corner button of the site and get started!
Objectives:
- Add other sites to scrape
- Clean up menu UI
  - Look at CLI gems: GLI, Main, Commander, executable, Methadone, sysexits, highline, trollop**
  - MVC
- Refactor Scrape_Indeed gem to include data persistence

As a user I want to be able to:
- View current 'saved searches'
- Execute one or all of those searches
- Add a new search
- Delete a search
- Scraping takes a while, update me on progress

Other Random and Crazy Ideas:
- Use Google Maps to find address of companies
  - Map results of a query
  - E.g. show user where results are geographically dense
  - How far are jobs from home?
- Duplicated data
  - Check job post url against DB
- Reports
  - X % of jobs include the keyword ruby, etc.
  - Trends etc.

UML
Companies have many jobs
Jobs belong to companies

Job Sites have many searches
Job sites have many jobs through searches
Searches belong to job sites

--Selecting queries for Tableau visulaization
--Queries are used form SQL Data Exploration project


--Table 1
--Global Numbers

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..['Covid Deaths$']
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

--Table 2
--We focus on Europian Union 

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..['Covid Deaths$']
--Where location like '%states%'
Where continent is null 
and location not in ('world','Europian Union','International')
Group by Location
order by TotalDeathCount desc

--Table 3
-- Countries with Highest Infection Rate 

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..['Covid Deaths$']
--Where location like '%states%'
Group by Location, Population, 
order by PercentPopulationInfected desc

--Table 4
-- Sorting using date

Select Location, Population, date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..['Covid Deaths$']
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc


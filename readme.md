# Old School Runescape Quest Requirement DB
## Introduction
## About
This repository contains a SQL Server Docker image containing a table of Old School Runescape's quests and their required skill levels for completion. It can be queried in order to determine what quests you can complete given your account's skill levels.
### How It Works
1. When the Docker container is initialized, the quest list CSV file is moved to a location reachable by SQL Server (*entryPoint.sh* and *setupDb.sh*)
2. Port 1433 is exposed for external access
3. Once SQL Server is initialized, the QuestList table is created and populated using the CSV (*setup.sql*)
### Quest Requirement Calculation Logic
#### Rules of Thumb
- If a quest does not require a certain level for a particular skill, it is presumed that the "required" level for that skill is 1.
- If completing a quest requires prior completion of another quest, the skill requirements for the requisite quest are factored in.
	- For example, *Fairytale I - Growing Pains* requires completing *Lost City*. *Lost City* requires 31 crafting and 36 woodcutting. As a result, the minimum crafting levels listed in the database for *Fairytale I* are 31 and 36, respectively.
	- In such scenarios, if both the main and pre-requisite quest have a skill requirement, the higher of the two is listed as the required skill level for the main quest.
#### Exclusions
- This database does not account for minimum Quest Point requirements a quest may have (i.e. for *Heroes' Quest*, *Legends' Quest*, and so on).
- This database does not account for quest requirements for Ironmen. Ironmen cannot trade items with other players. Consequently, they may need higher skill level(s) to obtain the items for completing a quest.
- This database does not account for Kourend's favour system. Some quests DO require that you have a minimum favour level with one of Kourend's cities.
## Instructions
1. Run `sh run.sh` from your terminal
2. Connect to localhost:1433 with username **sa** and password **Password1!** from your SQL Server tool of choice. Personally I use [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15).
3. Query away!
## Updates
If you find any inaccuracies in the quest list CSV, or if a new quest is released, please submit a pull request with an updated list.
# \# Tariq-Zeyad-Database-Assignment-2-Creating-Tables

# 

# Database Assignment 2 – BidNile Online Auctions

# 

# \## Project Overview

# 

# This project focuses on designing and implementing a relational database for \*\*BidNile\*\*, an online auction platform targeting Egypt, Saudi Arabia, and the United Arab Emirates.

# 

# The database is developed using Microsoft SQL Server and follows relational database design principles, data integrity rules, and normalization concepts.

# 

# \## Technologies

# 

# \- Microsoft SQL Server 2019+

# \- SQL Server Management Studio (SSMS) 20+

# \- T-SQL

# \- C#

# 

# \## Database Architecture

# 

# The database is organized into the following schemas:

# 

# | Schema | Description |

# |---|---|

# | Core | Countries, cities, members, and wallets |

# | Logistics | Warehouses and employees |

# | Catalog | Categories, items, and item photos |

# | Trading | Auctions and bids |

# | Marketing | Auction follows |

# 

# \## Assignment Tasks

# 

# \### Task 1 – Database Design and Mapping

# \- Database mapping and relational design for the BidNile system.

# 

# \### Task 2 – Database Creation

# \- Created the BidNile database.

# \- Created the Core, Logistics, Catalog, and Trading schemas.

# \- Created the required tables.

# \- Defined primary keys, unique constraints, check constraints, and default constraints.

# 

# \### Task 3 – Database Alterations

# \- Added foreign key relationships using `ALTER TABLE`.

# \- Applied referential integrity rules.

# \- Configured cascading delete for item photos.

# \- Added and modified columns and constraints.

# \- Renamed columns using `sp\_rename`.

# \- Updated data types and nullability.

# \- Updated commission and auction status rules.

# \- Added `BuyNowPrice` and validation.

# \- Enforced unique mobile numbers.

# \- Added `VerifiedAt` and removed `IsVerified`.

# \- Created the Marketing schema and transferred `AuctionFollow`.

# 

# \### Task 4 – Data Import

# \- Inserted sample data using T-SQL `INSERT` statements.

# \- Added sample countries, cities, members, wallets, warehouses, employees, categories, items, item photos, auctions, bids, and auction follows.

# \- Used transactions to maintain data consistency.

# 

# \### Task 5 – C# Algorithm

# \*\*LeetCode 238 – Product of Array Except Self\*\*

# 

# \- Implemented the solution in C#.

# \- Achieved O(n) time complexity.

# \- Achieved O(1) extra space complexity, excluding the output array.

# \- Solved without using division.

# 

# \## Project Structure

# 

# ```text

# .

# ├── Task\_01\_Mapping/

# ├── Task\_02\_Database\_Creation/

# ├── Task\_03\_Alterations/

# ├── Task\_04\_Data\_Import/

# ├── Task\_05\_CSharp/

# └── README.md

# ```

# 

# \## Author

# 

# \*\*Tariq Zeyad\*\*




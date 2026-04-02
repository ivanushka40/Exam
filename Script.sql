create table "Authors"  (
    Id integer generated always as identity PRIMARY key not null,
    Name varchar(255) not null,
    Surname varchar not null,
    CountryId integer not null,
    Foreign key (CountryId) references Authors(id) on delete set null 
);



create table "Books" (
	Id integer generated always as identity PRIMARY KEY,
	Name varchar(255) not null,
	Pages integer  not null,
	Price decimal not null,
	PublishDate DATE DEFAULT CURRENT_DATE,
	AuthorId integer not null,
	Foreign key (AuthorId) references Authors(id) on delete set null,
	ThemeId integer not null,
	Foreign key (ThemeId) references Theme(id) on delete set null,
);


create table "Countries" (
	Id integer generated always as identity PRIMARY KEY,
	Name varchar(50) not null,
);


create table Sales (
	Id integer generated always as identity PRIMARY KEY,
	Price decimal not null,
	Quantity integer not null,
	SaleDate DATE DEFAULT CURRENT_DATE,
	BookId integer  not null,
	Foreign key (BookId) references Book(id) on delete set null,
);



create table "Shops" (
	Id integer generated always as identity PRIMARY KEY,
	Name varchar not null,
	CountryId integer  not null,
	Foreign key (countryId) references country(id) on delete set null,
);


create table "Themes" (
	Id integer generated always as identity PRIMARY key not null,
	Name varchar(100) unique not null
);


select Id_Books from "Books" where Pages >= 500 and Pages <= 650;

select Id_Books where title like  'А%' OR title like 'З%';

select Theme_Id as 'Детективы' from "Books" where Quantity (Sales) > 30;

select Id_Books from  "Books" where Title like  '%microsoft%' and  Title not like '%windows%';

select Name, Theme_Id, Name(Authors) from "Books" 


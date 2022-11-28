CREATE TABLE IF NOT EXISTS MusicalStyle (
	id SERIAL PRIMARY KEY,
	Name_style VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	id SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS CategoryStyle (
	MusicalStyle_id INTEGER REFERENCES MusicalStyle(id),
	Musician_id INTEGER REFERENCES Musician(id),
	CONSTRAINT PK_CategoryStyle PRIMARY KEY (MusicalStyle_id, Musician_id)
);


CREATE TABLE IF NOT EXISTS AlbumList (
	id SERIAL PRIMARY KEY,
	Name VARCHAR(40) unique NOT NULL,
	Release_year INTEGER check(Release_year>1950)
);


CREATE TABLE IF NOT EXISTS CategoryAlbum (
	AlbumList_id INTEGER REFERENCES AlbumList(id),
	Musician_id INTEGER REFERENCES Musician(id),
	CONSTRAINT PK_CategoryAlbum PRIMARY KEY (AlbumList_id, Musician_id)
);


CREATE TABLE IF NOT EXISTS Songs (
	id SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Duration INTEGER,
	AlbumList_id INTEGER REFERENCES AlbumList(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	Name VARCHAR(40) unique NOT NULL,
	Year INTEGER check(year_of>1950),
);

CREATE TABLE IF NOT EXISTS SongCollection (
	Song_id INTEGER REFERENCES Songs(id),
	Collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT PK_SongCollection PRIMARY KEY (Song_id, Collection_id)
);
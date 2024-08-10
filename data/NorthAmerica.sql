PRAGMA foreign_keys=OFF;

CREATE TABLE IF NOT EXISTS LeafMorphology (
    leafMorphologyId INTEGER NOT NULL PRIMARY KEY,
    leafShape TEXT,
    leafColor TEXT
    leafWidth INTEGER,
    leafHeight TEXT,
    leafApex TEXT,
    leafBase TEXT,
    leafVenation TEXT,
    leafPetiole TEXT,
    leafMargins TEXT,
    leafPubescenence TEXT,
    leafShapeDesc TEXT,
    leafShapeImageDef BLOB,
    leafShapeImage BLOB
);

CREATE TABLE IF NOT EXISTS LeafMorphMembers (
    leafMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    leafTraits INTEGER,
    FOREIGN KEY(leafTraits) REFERENCES LeafMorphology(leafMorphologyId)
);


CREATE TABLE IF NOT EXISTS GrowthHabitsMorphology (
    growthHabitsMorpholgyId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS GrowthHabitsTypeMorphology (
    growthHabitsTypeMorpholgyId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS GrowthHabitsMorphMembers (
    growthHabitsMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    growthHabitsType TEXT,
    growthHabitsTraits TEXT,
    FOREIGN KEY(growthHabitsTraits) REFERENCES GrowthHabitsMorphology(growthHabitsMorphologyId),
    FOREIGN KEY(growHabitsType) REFERENCES GrowthHabitsTypeMorphology(growthHabitsTypeMorpholgyId)
);

CREATE TABLE IF NOT EXISTS AxillaryBudMorphology (
    axillaryBudMorphologyId INTEGER NOT NULL PRIMARY KEY,
    axillaryBudShape TEXT,
    axillaryBudColor TEXT,
    axillaryBudDistribution TEXT,
    axillaryBudPubescence TEXT
);

CREATE TABLE IF NOT EXISTS AxillaryudMorphMembers (
    axillarybudMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    axillaryBudTraits TEXT,
    FOREIGN KEY(axillaryBudTraits) REFERENCES AxillarybudMorphology(axillaryBudMorphologyId)
);

CREATE TABLE IF NOT EXISTS StemMorphology (
    stemMorphologyId INTEGER NOT NULL PRIMARY KEY,
    stemColor TEXT,
    stemLength INTEGER,
    stemPubescence TEXT
);

CREATE TABLE IF NOT EXISTS StemMorphMembers (
    stemMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    stemTraits TEXT,
    FOREIGN KEY(stemTraits) REFERENCES StemMorphology(stemMorphologyId)
);

CREATE TABLE IF NOT EXISTS BarkMorphology (
    barkMorphologyId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS BarkMorphMembers (
    barkMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    barkTraits INTEGER,
    FOREIGN KEY(barkTraits) REFERENCES BarkMorphology(budMorphologyId)
);

CREATE TABLE IF NOT EXISTS RootsMorphology (
    rootsMorphologyId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS rootMorphMembers (
    rootMorphMemberId INTEGER NOT NULL PRIMARY KEY,
    rootTraits INTEGER,
    FOREIGN KEY(rootTraits) REFERENCES RootMorphology(RootMorphologyId)
);

CREATE TABLE IF NOT EXISTS Morphology (
    morphologyId INTEGER NOT NULL PRIMARY KEY,
    leafMorphMemberId INTEGER,
    growthHabitsMorphMemberId INTEGER,
    budMorphMemberId INTEGER,
    stemMorphMemberId INTEGER,
    barkMorphMemberId INTEGER,
    rootsMorphMemberId INTEGER,
    FOREIGN KEY(leafMorphMemberId) REFERENCES LeafMorphMembers(leafMorphMemberId)
);

CREATE TABLE IF NOT EXISTS Family (
    familyId INTEGER NOT NULL,
    morphReferenceId INTEGER NOT NULL,
    scientificName TEXT NOT NULL,
    commonName TEXT NOT NULL,
    wikiDescId INTEGER, 
    mobotDescId INTEGER,
    fnaDescId INTEGER,
    miscDescId INTEGER,
    PRIMARY KEY(familyId, morphReferenceId),
    FOREIGN KEY(morphReferenceId) REFERENCES Morphology(morphologyId)
);

PRAGMA foreign_keys=ON;

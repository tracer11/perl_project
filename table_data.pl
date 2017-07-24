#!/usr/bin/perl

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "test.db";
my $dsn = "DBI:$driver:dbname = $database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
   or die $DBI::errstr;
print "Opened database successfully\n";

my $stmt = qq(INSERT INTO PEOPLE (FIRST , LAST, HOME)
               VALUES ('KAROL', 'GURBA', 'EARTH'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PEOPLE (FIRST, LAST, HOME)
               VALUES ('DERRICK', 'ROSE', 'EARTH' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PEOPLE (FIRST, LAST, HOME)
               VALUES ('MICHAEL', 'JORDAN', 'EARTH' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PEOPLE (FIRST, LAST , HOME)
               VALUES ('SCOTTIE', 'PIPPEN', 'EARTH' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;


print "Records created successfully\n";
$dbh->disconnect();
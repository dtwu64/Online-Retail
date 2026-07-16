-- Recall the yearly revenues
-- 2009:  $683,504.01
-- 2010:  $8,374,496.09
-- 2011:  $8,316,804.16 

-- Why is 2009 so low? 
-- Do a quick investigation of the time frame this data encompasses

SELECT MIN(invoicedate), MAX(invoicedate) FROM orders;
-- "2009-12-01 07:45:00"	"2011-12-09 12:50:00"

-- 2009 only has data from December 
-- 2010 has data from the full year 
-- 2011 has data for most of the year up to Dec 9
-- Perhaps that is why 2011 is lower than 2010, 
-- but we might expect it to be higher if we expect revenue to grow each year (something for the business to improve?)
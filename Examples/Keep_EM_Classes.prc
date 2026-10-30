# Keep only the equipment module classes in the export.
#
# Their embedded composites are kept automatically, and SCHEMA and LOCALE are always kept.
# Library items the classes use (control module classes, composites, named sets) are left out:
# open Export check before saving to see them. To include them as well, add REQD_ALL on the last line.
SELECT_NONE
CATEGORY Contains <Equipment Module Classes>,<True>,<Select>

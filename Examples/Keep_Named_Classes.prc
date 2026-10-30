# Keep specific classes by name, using a regular expression.
#
# Change the pattern to the classes you want: ^EM0[13]-00$ matches EM01-00 and EM03-00.
# Their embedded composites are kept automatically.
SELECT_NONE
NAME Matches <^EM0[13]-00$>,<True>,<Select>

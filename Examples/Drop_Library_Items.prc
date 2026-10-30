# Keep everything except the shared library content that an export pulls in.
#
# Drops function block templates, named sets, library composites and control module classes,
# and keeps your own classes and modules. Check Export check before saving.
SELECT_ALL
TYPE = <FUNCTION_BLOCK_TEMPLATE>,<True>,<Deselect>
TYPE = <ENUMERATION_SET>,<True>,<Deselect>
CATEGORY Contains <Library/Composite>,<True>,<Deselect>
CATEGORY Contains <Control Module Classes>,<True>,<Deselect>

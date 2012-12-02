# build.ps1

$python = "c:\Python27\python.exe"
$pyscripts = "c:\Python27\Scripts"
$pandoc = "C:\Program Files (x86)\Pandoc\bin\pandoc.exe"

# edit reStructuredText resume using
# http://rst.ninjs.org/
$infile = "fahdkhan-resume.rst"

& $python $pyscripts\rst2html.py $infile out/fahdkhan-resume.html 

# usage instructions http://docutils.sourceforge.net/docs/user/odt.html
& $python $pyscripts\rst2odt.py --no-sections --stylesheet=resume-styles.odt --table-border-thickness=0 $infile out/fahdkhan-resume.odt 

# pandoc
# http://johnmacfarlane.net/pandoc/README.html
& $pandoc -f rst -t plain $infile -o out/fahdkhan-resume.txt
& $pandoc -f rst -t markdown $infile -o out/fahdkhan-resume.md

# Potential tool to automate creating docx file
# https://github.com/dagwieers/unoconv

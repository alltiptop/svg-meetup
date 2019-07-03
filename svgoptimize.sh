for file in $(find ./ -name '*.svg');
do
	# remove defs
	svgcleaner --indent=4 --remove-xmlns-xlink-attribute=true --ungroup-defs=true $file $file

	# remove groups and move transforms to path, save terrible svg
	inkscape -f $file --verb=EditSelectAll --verb=SelectionUnGroup --verb=SelectionUnGroup --verb=SelectionUnGroup --verb=SelectionUnGroup --verb=SelectionUnGroup --verb=FileSave --verb=FileQuit

	# clean inkscape trash
	svgcleaner --indent=4 --remove-xmlns-xlink-attribute=true --apply-transform-to-paths=true $file $file
	svgcleaner --indent=4 --ungroup-defs=true --paths-coordinates-precision=4 $file $file
done

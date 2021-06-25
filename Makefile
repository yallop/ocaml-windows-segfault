all:
	ocamlfind opt -thread -package threads bug.ml -linkpkg -o bug.exe
	for i in `seq 1 20` ; do echo "running..."; ./bug.exe; done

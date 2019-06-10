SHELL=/usr/local/bin/fish

README.md: $(shell find . -name "*.yaml")
	echo '### Available _jq methods_:' > README.md
	echo '' >> README.md
	for m in (ls *.yaml); \
      set name (echo $$m | tr "." "\n" | head -n 1); \
      echo "* [`$$name`]($$m):" >> README.md; \
      echo  "" >> README.md; \
      echo -n "  " >> README.md; \
      yq.v2 read $$m description | perl -p -e 's/\n/\n  /g' >> README.md; \
      echo '' >> README.md; \
    end;

methods.png: $(shell find . -name "*.yaml")
	set text ''
	for m in (ls *.yaml); \
      set text "$$text\n"; \
      set name (echo $$m | tr "." "\n" | head -n 1); \
      set text "$$text<span font_family='monospace'>$$name</span>\n"; \
      set desc (yq.v2 read $$m description | head -n 1); \
      echo $$desc; \
      set text "$$text<small>$$desc</small>\n\n"; \
    end; \
	echo $$text; \
	convert pango:$$text methods.png;

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
	text=""
	for m in $$(ls *.yaml); do \
      text+="\n"; \
      text+="<span font_family='monospace'>$$(echo $$m | tr "." "\n" | head -n 1)</span>\n"; \
      text+="<small>$$(yq.v2 read $$m description | perl -p -e 's/\n/\n/g')</small>\n\n"; \
    done;
	echo $$text
	convert pango:$$text methods.png

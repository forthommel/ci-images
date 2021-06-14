# syntax=docker/dockerfile:1
FROM continuumio/miniconda3
RUN apt-get update
RUN apt-get install --yes ghostscript xvfb
RUN python --version
RUN pip install --upgrade pip
RUN echo "numpy #==1.19.1\n" \
	 "colormap #==1.0.3\n" \
	 "easydev #==0.9.38\n" \
	 "PyAutoGUI #==0.9.50\n" \
	 "pandas\n" \
	 "tables\n" \
	 "ghostscript\n" \
	 "multiprocess\n" \
	 "# below from https://gitlab.cern.ch/adavid/mylittleassigner\n" \
	 "unittest-xml-reporting == 3.0.4\n" \
 	 "coverage == 5.3\n" \
	 "mypy == 0.790\n" \
	 "pylint == 2.6.0\n" \
	 "flake8 == 3.8.4\n" \
	 "parameterized == 0.7.4\n" > requirements.txt
RUN pip install -r requirements.txt


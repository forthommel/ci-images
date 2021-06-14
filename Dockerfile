# syntax=docker/dockerfile:1
FROM continuumio/miniconda3
RUN apt-get update
RUN python --version
RUN pip install --upgrade pip
RUN apt-get install --yes ghostscript xvfb

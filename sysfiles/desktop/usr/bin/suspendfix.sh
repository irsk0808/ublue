#!/bin/bash

rpm-ostree kargs --append-if-missing='acpi_osi="!Windows 2015"'

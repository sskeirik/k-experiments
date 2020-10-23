# global default values

main_module    = $(error the variable `main_module` should be set in experiment makefile)
main_file_name = $(shell awk 'BEGIN{print(tolower("$(main_module)"))}')
main_file      = $(main_file_name).k
def_module     = $(main_module)
backend        =
kompile_opts   =

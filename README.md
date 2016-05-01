# vim-cdproject

Set a list of projects and go to them easily

## Installation
**through Vundle**:

Plugin 'juancamilo-nb/vim-cdproject'

## Usage
1. Set a project directory

    Enter to a directory: 
    
        :cd /var/foo
        :Setproject <any_name_for_your_project>

2. List all your projects
    
        :Listprojects

3. Enter to a project previously saved

        :Cdproject <project_name>
    
4. Remove a project from the list

        :Removeproject <project_name>

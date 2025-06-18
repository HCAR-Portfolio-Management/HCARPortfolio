
# Table of Contents

1.  [HCAR ARTIST PORTFOLIO DATABASE](#orgb500e26)
    1.  [overview](#org664e10b)
    2.  [Prerequisites](#org2e91d58)
    3.  [Instructions](#org456e938)
        1.  [Testing](#org84438c7)
        2.  [Development](#org510c4a8)



<a id="orgb500e26"></a>

# HCAR ARTIST PORTFOLIO DATABASE


<a id="org664e10b"></a>

## overview

-   This contians the source code for the HCAR artist portfolio database,
    as well as a Dockerfile that is intended to initialize and run the database
    and website.
-   This project uses Django for client and data-tier, MariaDB for backend
    and gUnicorn for hosting.


<a id="org2e91d58"></a>

## Prerequisites

-   Docker CLI


<a id="org456e938"></a>

## Instructions

### Cloning the Repo

1. In the terminal navigate to the folder where you want to clone the project.
2. On the Github repo, click the green "Code" button and copy the HTTPS link.
3. Back on your terminal, use the command `git clone https://github.com/HCAR-Portfolio-Management/HCARPortfolio.git`

<a id="org84438c7"></a>

### Testing

-   This docker container can be built with the following bash command
    
        sudo docker build -t test ./ && sudo docker image prune -y

-   and can be run with
    
        sudo docker run --net host -ti -p 8000:8000 test
    
    -   This will set up the environment variables listed in Dockerfile, and then call the script .src/setup.sh
        -   As of 10:13 A.M. 03/08/25, setup.sh will enable the
            MariaDB server and use it to run src/sql/init.sql
    -   After this, you should be able to connect to the site at http://localhost:8000


<a id="org510c4a8"></a>

### Development

All development should ideally be done outside of the docker package.

1.  extending the SQL database

    -   Place your .SQL scripts in ./src/sql
    -   call them from within the script ./src/sql/init.sql

2.  Python development

    1.  Setting up your python environment
    
        -   Create a virtualenv in the project root
            
                python3 -m venv venv
        -   and enter the venv
            -   windows:
                
                    # In cmd.exe
                    venv\Scripts\activate.bat
                    # In PowerShell
                    venv\Scripts\Activate.ps1
            -   UNIX (linux/macos)
                
                    $ source myvenv/bin/activate
        -   on UNIX (linux/MacOS/wsl), you can enter the venv with the following command:
            
                source ./src/venv/bin/activate
        -   Once your venv is activated (should see &ldquo;venv&rdquo; near your prompt), run
            
                pip install -r requirements.txt
    
    2.  extending the python environment
    
        -   the VENV should now contain a number of packages. See **requirements.txt** for a list of these.
            -   If you need to extend the venv, follow these steps:
                -   ensure you are **inside the venv**, and **outside of docker**
                -   pip3 install <package name>
                -   cd to the root of the project directory (where **requirements.txt** is)
                -   use the following command to add the new packages to the project:
                    
                        pip freeze > requirements.txt
                    
                    or
                    
                        python3 pip freeze > requirements.txt

3.  Adding your code to the Docker

    -   Edit src/setup.sh to run the commands necessary to initialize the Django website and server as needed.

4.  Pushing your changes

    -   Please create a git branch with you ID (e.g. &ldquo;mt410&rdquo;),
    -   check out your own branch
    -   commit to your own branch
    -   push to origin <yourid>
    -   and submit a pull request.


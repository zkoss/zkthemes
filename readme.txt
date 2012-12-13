*** How to build the project ***

run the following maven command

:) mvn clean package

and then the distribution files are put into the "dist" directory(including the Maven's bundle jar for Maven repository)


*** How to create a new theme ***

Please follow the breeze's structure.
For example,

breeze/
      /pom.xml (Maven project setting)
      /src/ (the ZK default structure, or you can also use the Maven default structure, like main/java main/resource)
          /archive
          /org
      /assembly (the build setting, you have to copy it as well)

*** Download standalone theme zip file ***

Download the latest standalone theme from google code (http://code.google.com/p/zkthemes/downloads/list)

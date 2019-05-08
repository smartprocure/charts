FROM mcr.microsoft.com/mssql/server:2017-CU13-ubuntu

# apt-get and system utilities
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        debconf-utils \
        curl \
    && rm -rf /var/lib/apt/lists/*

## SQL Server Drivers, Command Line Tools, Full Text Search, Integration Services
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list > /etc/apt/sources.list.d/mssql-server-2017.list \
    # && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && apt-get update && DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y \
        # unixodbc-dev \
        msodbcsql \
        mssql-tools \
        mssql-server-fts \
        # Integration Services is not working in Docker yet
        # https://github.com/Microsoft/mssql-docker/issues/213
        # mssql-server-is \
    && /opt/mssql/bin/mssql-conf set sqlagent.enabled true \
    #&& LC_ALL=en_US.UTF-8 ACCEPT_EULA=Y /opt/ssis/bin/ssis-conf -n setup \
    #&& echo 'export PATH="$PATH:/opt/ssis/bin"' >> ~/.bashrc \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
    && /bin/bash -c "source ~/.bashrc"

## Locales
RUN apt-get -y install locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8

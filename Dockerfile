FROM paperspace/gradient-base:pt112-tf29-jax0317-py39-20230125


RUN curl -fsSL https://code-server.dev/install.sh | sh

# ==================================================================
# Startup
# ------------------------------------------------------------------


# TODO: Install add ons

#CMD jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True
COPY run.sh /run.sh
COPY *.vsix /opt/code-server/extensions/
RUN code-server --force --install-extension ms-python.python
RUN code-server --install-extension /opt/code-server/extensions/GitHub.copilot-1.*.vsix
RUN code-server --install-extension /opt/code-server/extensions/GitHub.copilot-chat-0.9.2023103102-patched.vsix
RUN code-server --install-extension /opt/code-server/extensions/GitHub.copilot-labs-*.vsix
RUN code-server --force --install-extension ms-toolsai.jupyter
RUN code-server --force --install-extension mikestead.dotenv
RUN code-server --force --install-extension ms-vscode.makefile-tools
RUN code-server --force --install-extension redhat.vscode-yaml
RUN code-server --force --install-extension ms-python.flake8
RUN code-server --force --install-extension davidanson.vscode-markdownlint
RUN code-server --force --install-extension anweber.statusbar-commands
RUN code-server --force --install-extension amazonwebservices.aws-toolkit-vscode
RUN code-server --force --install-extension boto3typed.boto3-ide
RUN code-server --force --install-extension necatiarslan.aws-s3-vscode-extension
RUN code-server --force --install-extension jebbs.plantuml
RUN code-server --force --install-extension mechatroner.rainbow-csv
RUN code-server --force --install-extension GrapeCity.gc-excelviewer
RUN code-server --force --install-extension alefragnani.Bookmarks
RUN code-server --force --install-extension oderwat.indent-rainbow	
RUN code-server --force --install-extension yzhang.markdown-all-in-one
RUN code-server --force --install-extension ms-azuretools.vscode-docker
RUN code-server --force --install-extension euskadi31.json-pretty-printer
RUN code-server --force --install-extension nickdemayo.vscode-json-editor
RUN code-server --force --install-extension zainchen.json
RUN code-server --force --install-extension hilleer.yaml-plus-json
RUN code-server --force --install-extension khaeransori.json2csv
RUN code-server --force --install-extension ccimage.jsonviewer
RUN code-server --force --install-extension aykutsarac.jsoncrack-vscode
RUN code-server --force --install-extension oliversturm.fix-json
RUN code-server --force --install-extension malo.copy-json-path

RUN mkdir -p /root/.local/bin
RUN curl https://pyenv.run | bash 

COPY .bashrc  /root/.bashrc 

ENV PATH="/root/.pyenv/bin:$PATH"
RUN pyenv install 3.11.4
RUN pip3 install yq jq
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN apt-get install -y git
EXPOSE 8888 6006
ENTRYPOINT ["/run.sh"]

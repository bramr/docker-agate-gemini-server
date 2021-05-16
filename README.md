# Docker image build for agate gemini server

I use this build for my own gemini servers. 
Feel free to use it too.

By default it uses localhost and files and certs in the container, which is not very useful.
For an idea how you could set it up see the: docker-compose.example.yml file.
Please note this container supports multiple hostnames (separated by a comma).
Always generate your own certificates outside the container. (and safeguard them)
The certs directory holds a script to quickly generate Agate compatible cert and keys (der format)

For more details about Agate go to: [Agate github page](https://github.com/mbrubeck/agate#agate)

For more information about gemini protocol: gemini://gemini.circumlunar.space/

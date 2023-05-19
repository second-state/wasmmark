# syntax = edrevo/dockerfile-plus
INCLUDE+ ./docker/base.Dockerfile

CMD ["zx", "--quiet", "./run.mjs", "./runners/node.mjs"]

def main(ctx):
  return [
    testing(ctx),
  ]

def testing(ctx):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'testing',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'steps': [
      {
        'name': 'lint',
        'image': 'toolhippie/yamllint:latest',
        'pull': 'always',
        'commands': [
          'yamllint .',
        ],
      },
      {
        'name': 'kustomize',
        'image': 'toolhippie/kubectl:latest',
        'pull': 'always',
        'commands': [
          'kustomize build .',
        ],
      },
    ],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
        'refs/pull/**',
      ],
    },
  }

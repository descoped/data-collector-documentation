# Asciidoctor installation

## MacOS

Installation guide: https://gorails.com/setup/osx/10.15-catalina

```
# asciidoctor cli
gem install asciidoctor

# plant uml and diagram support
gem install asciidoctor-kroki
```

## Important notice

The asciidoctor plantuml processor doesn't support nested relative paths. The compatibility between Idea PlantUML plugin and the CLI causes asciidocs seems incompatible. The Idea Plugin doesn't respect the `:docdir` directive, which causes Idea editor to render files differently.

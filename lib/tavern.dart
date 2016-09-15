library tavern;

import 'package:barback/barback.dart';

import 'package:tavern/src/markdown.dart';
import 'package:tavern/src/metadata.dart';
import 'package:tavern/src/metadata_aggregator.dart';
import 'package:tavern/src/template.dart';
import 'package:tavern/src/cleanup.dart';
import 'package:tavern/src/tag_index.dart';
import 'package:tavern/src/tag_pages.dart';
import 'package:tavern/src/template_cleanup.dart';

class Tavern implements TransformerGroup {
  final Iterable<Iterable> phases;
  Tavern() : phases = createPhases();
  Tavern.asPlugin(settings) : this();
}

List<List<Transformer>> createPhases() {
  return [
    [new Metadata()],
    [new TagIndex()],
    [new MetadataAggregator()],
    [new Markdown()],
    [new Template()],
    [new TemplateCleanup()],
    [new TagPages()],
    [new Cleanup()],
  ];
}

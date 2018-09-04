import 'package:flutter/widgets.dart';

import 'package:graphql_flutter/src/graphql_client.dart';
import 'package:graphql_flutter/src/widgets/graphql_provider.dart';

typedef Widget GraphQLConsumerBuilder(GraphQLClient client);

class GraphQLConsumer extends StatelessWidget {
  GraphQLConsumer({
    final Key key,
    @required this.builder,
  }) : super(key: key);

  final GraphQLConsumerBuilder builder;

  Widget build(BuildContext context) {
    /// Gets the client from the closest wrapping [GraphQLProvider].
    GraphQLClient client = GraphQLProvider.of(context).value;
    assert(client != null);

    return builder(client);
  }
}
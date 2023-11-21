import 'package:flutter_map/flutter_map.dart';

import '../../constants.dart';


TileLayer tileLayerWidget() => TileLayer(
      urlTemplate: urlTemplate,
      subdomains: subDomain,
    );

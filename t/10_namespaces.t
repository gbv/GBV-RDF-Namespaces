use strict;
use Test::More;

use GBV::RDF::Namespaces;

my $map = $GBV::RDF::Namespaces::NS;

is ( $map->frbr('Item')->uri_value, 'http://purl.org/vocab/frbr/core#Item', 'frbr:Item' );
is ( $map->uri('gbv:iln')->uri_value, 'http://purl.org/ontology/gbv/iln', 'gbv:iln' );

done_testing;

use utf8;
package Bio::Track::Schema::Result::Assembly;

=head1 NAME

Bio::Track::Schema::Result::Assembly

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<assembly>

=cut

__PACKAGE__->table("assembly");

=head1 ACCESSORS

=head2 assembly_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 reference_size

  data_type: 'bigint'
  is_nullable: 1

=head2 taxon_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 translation_table

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "assembly_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "reference_size",
  { data_type => "bigint", is_nullable => 1 },
  "taxon_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "translation_table",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</assembly_id>

=back

=cut

__PACKAGE__->set_primary_key("assembly_id");

=head1 RELATIONS

=head2 mapstats

Type: has_many

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->has_many(
  "mapstats",
  "Bio::Track::Schema::Result::Mapstat",
  { "foreign.assembly_id" => "self.assembly_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 taxon

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Species>

=cut

__PACKAGE__->belongs_to(
  "taxon",
  "Bio::Track::Schema::Result::Species",
  { taxon_id => "taxon_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

1;

use utf8;
package Bio::Track::Schema::Result::Autoqc;

=head1 NAME

Bio::Track::Schema::Result::Autoqc

=cut

use strict;
use warnings;

use base 'Bio::Track::Schema::ResultBase';

=head1 TABLE: C<autoqc>

=cut

__PACKAGE__->table("autoqc");

=head1 ACCESSORS

=head2 autoqc_id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mapstats_id

  data_type: 'mediumint'
  default_value: 0
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 test

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 result

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 reason

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 200

=cut

__PACKAGE__->add_columns(
  "autoqc_id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "mapstats_id",
  {
    data_type => "mediumint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "test",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "result",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "reason",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 200 },
);

=head1 PRIMARY KEY

=over 4

=item * L</autoqc_id>

=back

=cut

__PACKAGE__->set_primary_key("autoqc_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<mapstats_test>

=over 4

=item * L</mapstats_id>

=item * L</test>

=back

=cut

__PACKAGE__->add_unique_constraint("mapstats_test", ["mapstats_id", "test"]);

=head1 RELATIONS

=head2 mapstat

Type: belongs_to

Related object: L<Bio::Track::Schema::Result::Mapstat>

=cut

__PACKAGE__->belongs_to(
  "mapstat",
  "Bio::Track::Schema::Result::Mapstat",
  { mapstats_id => "mapstats_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

1;

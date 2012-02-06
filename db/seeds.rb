# -*- encoding: UTF-8 -*-

Placement.create(:name => 'ogikubo',
                 :latitude => 12.0,
                 :longitude => 12.0)

Placement.create(:name => 'tsurukawa',
                 :latitude => 13.0,
                 :longitude => 12.0)

Placement.create(:name => 'kawasaki',
                 :latitude => 13.0,
                 :longitude => 1982.6)

User.create(
  :provider => 'manual',
  :uid      => 'arm',
  :name     => 'arm'
)

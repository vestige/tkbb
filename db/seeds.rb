# -*- encoding: UTF-8 -*-

Gym.create(:name => '荻窪B-PUMP',
                 :latitude => 35.708538,
                 :longitude => 139.615545)

Gym.create(:name => '秋葉原B-PUMP',
                 :latitude => 35.699826,
                 :longitude => 139.768324)

Gym.create(:name => 'シェルター',
                 :latitude => 36.559252,
                 :longitude => 139.897349)

User.create(
  :provider => 'manual',
  :uid      => 'arm',
  :name     => 'arm'
)

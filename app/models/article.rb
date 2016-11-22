class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # Если удаляете статью, связанные с ней комментарии также должны быть
  # удалены, в противном случае они будут просто занимать место в базе данных.
  # Rails позволяет использовать опцию dependent на связи для достижения этого.
  validates :title, presence: true,
                    length: {minimum: 5}

end

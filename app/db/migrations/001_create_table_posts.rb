class CreateTablePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      column :title, :text
      String :content
      index :title
    end
  end

  def down
    drop_table :posts
  end
end

# ./app/db/migrations/002_add_some_posts.rb
class AddSomePosts < Sequel::Migration
  def up
    Post.create(
      title: 'Что такое Lorem Ipsum?',
      content: 'Lorem Ipsum - это текст-"рыба"...'
    )
    Post.create(
      title: 'Почему он используется?',
      content: 'Давно выяснено, что при оценке дизайна...'
    )
    Post.create(
      title: 'Откуда он появился?',
      content: 'Многие думают, что Lorem Ipsum - взятый с потолка...'
    )
  end

  def down
  end
end

ActiveRecord::Schema.define :version => 0 do
  create_table :parametered_models, :force => true do |t|
    t.column :name, :string
    t.column :param, :string
  end
  
  create_table :unparametered_models, :force => true do |t|
    t.column :name, :string
  end
  
  create_table :slugged_models, :force => true do |t|
    t.column :name, :string
    t.column :slug, :string
  end
end
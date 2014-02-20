class Like < Socialization::ActiveRecordStores::Like
  belongs_to :album
  belongs_to :update
end

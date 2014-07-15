class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  belongs_to :category
  belongs_to :sub_category
  has_many :job_skills
  has_many :skills, through: :job_skills  

  has_attached_file :cover, :styles => { :large => "600x600>", :medium => "300x300>", :small => "100x100>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/jobs/:id_:style.:extension", :url => "/system/jobs/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniya',
                                          :access_key_id     => 'AKIAIDTQALVDJOTAFN5A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-us-west-1.amazonaws.com",
                      :bucket => "geniya"
  crop_attached_file :cover , :aspect => "600:600"
  validates_attachment :cover, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..1000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }  
 
  validates_presence_of :organization_id
  validates_presence_of :category_id
  validates_presence_of :sub_category_id
  validates :title,  presence: true, length: { minimum: 10, maximum: 140 }
  validates :description,  presence: true, length: { minimum: 10, maximum: 250 }
  validates :skills_text,  presence: true
  
  
end

json.extract! job_posting, :id, :buyer_id, :job_name, :description, :skills_required, :estimated_time, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)
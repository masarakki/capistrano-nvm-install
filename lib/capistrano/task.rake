namespace :nvm do
  namespace :install do
    task :nvm do
      on release_roles(fetch(:nvm_roles)) do
        nvm_path = fetch(:nvm_path)
        execute "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | NVM_DIR=#{nvm_path} bash" unless test("[ -d #{nvm_path} ]")
      end
    end

    task node: :nvm do
      on release_roles(fetch(:nvm_roles)) do
        nvm_node = fetch(:nvm_node)
        error "nvm: nvm_node is not set" and exit 1 unless nvm_node

        nvm_path = fetch(:nvm_path)
        nvm_node_path = Array(fetch(:nvm_node_path))
        execute "source #{nvm_path}/nvm.sh && nvm install #{nvm_node}" unless test(nvm_node_path.map {|p| "[ -d #{p} ]" }.join(" || "))
      end
    end
  end

  before 'validate', 'install:node'
end

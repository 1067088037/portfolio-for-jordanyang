backup_dir="./backup"
container="wp_mysql"
user="root"
pwd="123456"
database="wordpress"

# Get current time
time=$(date "+%Y%m%d_%H%M%S")

# Create backup directory
mkdir -p $backup_dir

# Backup database
docker exec -it $container mysqldump -u$user -p$pwd $database > $backup_dir/db_"$time".sql

# Backup wordpress
tar -zcvf $backup_dir/wp_"$time".tar.gz -C ./wordpress .

# Delete backup files 7 days ago
find $backup_dir -mtime +7 -name "*.tar.gz" -exec rm -rf {} \;
find $backup_dir -mtime +7 -name "*.sql" -exec rm -rf {} \;

# Delete empty directory
find $backup_dir -type d -empty -exec rm -rf {} \;

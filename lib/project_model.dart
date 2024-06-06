class Project {
  final String projectName;
  final String projectImage;
  final String githubLink;

  Project({required this.projectName, required this.projectImage, required this.githubLink});
}
// Assuming you have a list of projects
List<Project> projects = [
  Project(
    projectName: 'Meesho',
    projectImage: 'assets/Images/meesho-app-template.png',
    githubLink: 'https://github.com/user/project1',
  ),
  Project(
    projectName: 'Groceria',
    projectImage: 'assets/Images/groceria-app-template.png',
    githubLink: 'https://github.com/user/project2',
  ),
  Project(
    projectName: 'Musify',
    projectImage: 'assets/Images/musify-app-template.png',
    githubLink: 'https://github.com/user/project2',
  ),
  Project(
    projectName: 'Google News',
    projectImage: 'assets/Images/googlenews-app-template.jpg',
    githubLink: 'https://github.com/user/project2',
  ),
  Project(
    projectName: 'MyWallpaper',
    projectImage: 'assets/Images/wallpaper-app-template.png',
    githubLink: 'https://github.com/user/project2',
  ),

];



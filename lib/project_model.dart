class Project {
  final String projectName;
  final String projectDescription;
  final String projectImage;
  final String githubLink;

  Project({required this.projectDescription, required this.projectName, required this.projectImage, required this.githubLink});
}
// Assuming you have a list of projects
List<Project> projects = [
  Project(
    projectName: 'Meesho',
    projectImage: 'assets/Images/meesho-app-template.png',
    githubLink: 'https://github.com/patelneel9080/meesho.git', projectDescription: 'Empower Your Shopping: Discover, Share, and Save with Meesho',
  ),
  Project(
    projectName: 'Groceria',
    projectImage: 'assets/Images/groceria-app-template.png',
    githubLink: 'https://github.com/patelneel9080/Groceria-Food-Shopping-App.git', projectDescription: 'Shop Smart, Live Better: Your Seamless Shopping Experience',
  ),
  Project(
    projectName: 'Musify',
    projectImage: 'assets/Images/musify-app-template.png',
    githubLink: 'https://github.com/patelneel9080/Musify.git', projectDescription: 'Experience Music, Elevated: Your Ultimate All-in-One Entertainment Hub',
  ),
  Project(
    projectName: 'Google News',
    projectImage: 'assets/Images/googlenews-app-template.jpg',
    githubLink: 'https://github.com/patelneel9080/Google-News-App.git', projectDescription: 'Stay Informed, Stay Ahead: Your Personalized News Experience',
  ),
  Project(
    projectName: 'Pro-Wallpaper',
    projectImage: 'assets/Images/wallpaper-app-template.png',
    githubLink: 'https://github.com/patelneel9080/Pro-Wallpaper.git', projectDescription: 'Transform Your Screen: Stunning Wallpapers, Effortless Experience',
  ),

];



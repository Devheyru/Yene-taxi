allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
plugins {
    // The google-services plugin version is managed in settings.gradle.kts; avoid duplication here.
    // (Removed explicit version 4.4.4 to prevent conflict with 4.3.15 declared by FlutterFire CLI.)
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

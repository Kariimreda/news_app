abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsGetHeadLinesLoadingState extends NewsStates {}

class NewsGetHeadLinesSuccessState extends NewsStates {}

class NewsGetHeadLinesErrorState extends NewsStates {}

class NewsGetSearchedNewsLoadingState extends NewsStates {}

class NewsGetSearchedNewsSuccessState extends NewsStates {}

class NewsGetSearchedNewsErrorState extends NewsStates {}

class NewsGetCategoryLoadingState extends NewsStates {}

class NewsGetCategorySuccessState extends NewsStates {}

class NewsGetCategoryErrorState extends NewsStates {}


class NewsChangePageState extends NewsStates {}

class ChangeAppModeState extends NewsStates {}

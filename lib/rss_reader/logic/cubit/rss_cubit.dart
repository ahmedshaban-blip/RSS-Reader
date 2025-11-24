
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rss_state.dart';
import '../../data/repositories/rss_repository.dart';
import '../../data/models/rss_item.dart';

class RssCubit extends Cubit<RssState> {
  final RssRepository repository;

  RssCubit(this.repository) : super(const RssInitial());

  final int _pageSize = 5;
  List<RssItem> _allItems = [];
  int _currentPage = 1;

  Future<void> loadFeed(String url) async {
    emit(const RssLoading());
    try {
      _currentPage = 1;
      _allItems = await repository.fetchRssItems(url);

      final firstPageItems = _allItems.take(_pageSize).toList();
      final hasMore = _allItems.length > firstPageItems.length;

      emit(
        RssLoaded(
          visibleItems: firstPageItems,
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(RssError(e.toString()));
    }
  }

  void loadMore() {
    final currentState = state;
    if (currentState is! RssLoaded) return;
    if (!currentState.hasMore || currentState.isLoadingMore) return;

    emit(currentState.copyWith(isLoadingMore: true));

    _currentPage++;

    final nextCount = _pageSize * _currentPage;
    final newVisible = _allItems.take(nextCount).toList();
    final hasMore = _allItems.length > newVisible.length;

    emit(
      currentState.copyWith(
        visibleItems: newVisible,
        hasMore: hasMore,
        isLoadingMore: false,
      ),
    );
  }
}

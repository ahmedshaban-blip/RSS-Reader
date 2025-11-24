
import 'package:equatable/equatable.dart';
import '../../data/models/rss_item.dart';

abstract class RssState extends Equatable {
  const RssState();

  @override
  List<Object?> get props => [];
}

class RssInitial extends RssState {
  const RssInitial();
}

class RssLoading extends RssState {
  const RssLoading();
}

class RssLoaded extends RssState {
  final List<RssItem> visibleItems;
  final bool hasMore;
  final bool isLoadingMore;

  const RssLoaded({
    this.visibleItems = const [],
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  RssLoaded copyWith({
    List<RssItem>? visibleItems,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return RssLoaded(
      visibleItems: visibleItems ?? this.visibleItems,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [visibleItems, hasMore, isLoadingMore];
}

class RssError extends RssState {
  final String message;

  const RssError(this.message);

  @override
  List<Object?> get props => [message];
}

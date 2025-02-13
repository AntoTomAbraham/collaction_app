import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/crowdaction/crowdaction_comment.dart';
import '../../../infrastructure/crowdaction/crowdaction_comment_dto.dart';
import '../../core/collaction_icons.dart';
import '../../shared_widgets/expandable_text.dart';
import '../../themes/constants.dart';

part 'parts/comment_actions.dart';
part 'parts/comment_appbar_delegate.dart';
part 'parts/comment_item.dart';
part 'parts/comment_textfield.dart';

class CrowdActionCommentsPage extends StatelessWidget {
  const CrowdActionCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CommentAppBarDelegate(
              expandedHeight: 156,
              color: kPrimaryColor400,
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              30,
              0,
              30,
              MediaQuery.of(context).padding.bottom,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CommentItem(comment: _comments[index]);
                },
                childCount: _comments.length,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: const CommentTextField(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

const _dummyComment = 'This is my comment for this crowdaction.';
final List<CrowdactionComment> _comments = [
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: '$_dummyComment\n$_dummyComment',
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: true,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment + ('\n$_dummyComment') * 6,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
    flagged: true,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment + ('\n$_dummyComment') * 3,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
    flagged: true,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: '$_dummyComment\n$_dummyComment',
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: true,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment + ('\n$_dummyComment') * 6,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
    flagged: true,
  ),
  CrowdactionCommentDto(
    crowdactionId: '',
    content: _dummyComment + ('\n$_dummyComment') * 3,
    userId: '',
    createdAt: DateTime.now(),
    likes: 2,
    likedByMe: false,
    flagged: true,
  )
].map((e) => e.toDomain()).toList();
